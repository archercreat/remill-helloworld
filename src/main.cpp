#include <llvm/IR/Function.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/Support/FileSystem.h>
#include <remill/Arch/Arch.h>
#include <remill/Arch/Name.h>
#include <remill/BC/IntrinsicTable.h>
#include <remill/BC/Lifter.h>
#include <remill/BC/Optimizer.h>
#include <remill/BC/Util.h>
#include <remill/OS/OS.h>

int main() {
    // Load instruction semantics bitcode module
    llvm::LLVMContext context;
    auto arch = remill::Arch::GetHostArch(context);
    auto module = remill::LoadArchSemantics(arch);
    // Decode instruction bytes
    remill::Instruction inst;
    auto bytes = "\x48\x89\x5C\x24\x10";
    arch->DecodeInstruction(0, bytes, inst);
    // Create a "basic block" function to hold lifted instructions
    auto f = remill::DeclareLiftedFunction(&(*module), "func");
    remill::CloneBlockFunctionInto(f);
    // Lift instruction into block function
    remill::IntrinsicTable it(module);
    remill::InstructionLifter lifter(arch, it);
    lifter.LiftIntoBlock(inst, &(f->getEntryBlock()));
    remill::AddTerminatingTailCall(f, it.jump);
    // Optimize and dump the bitcode
    remill::OptimizeModule(&(*arch), &(*module), {f});
    f->dump();

    return 0;
}
