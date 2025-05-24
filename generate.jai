
#import "Bindings_Generator";
#import "Basic";
#import "File";
#import "String";
#import "BuildCpp";
#import "File_Utilities";

#run {
    using opts: Generate_Bindings_Options;

    array_add(*libpaths, "bin/win");
    array_add(*libnames, "qdft");

    array_add(*source_files, "qdft/c/qdft_c.h");
    // array_add(*source_files, "qdft/cpp/src/qdft/qdft.h");

    array_add(*extra_clang_arguments, "-Wno-error=implicit-int");
    array_add(*extra_clang_arguments, "-x", "c++");

    generate_bindings(opts, "module.jai");
}
