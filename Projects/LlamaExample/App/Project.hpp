#pragma once

#include "CharPointer.hpp"
#include "CharArrayPrimitive.hpp"
// Must precede WindowsPrinter.hpp: its print template resolves the
// Support::Print overloads visible at the point of definition.
#include "Print_CharArray.hpp"
#include "WindowsPrinter.hpp"
#include "LLM.hpp"

#include "WindowsFile.hpp"
#include "FileManager.hpp"
#include "TextLoader.hpp"
#include "ImageLoader.hpp"
#include "BinaryFile.hpp"
#include "GGUFFile.hpp"
#include "FloatArray.hpp"
#include "PixelArray.hpp"

using namespace pankey::Library::Print;
using namespace pankey::Utility::Test;

using pankey::Type::Array::CharArray;
using pankey::Type::Array::FloatArray;
using pankey::Type::Array::PixelArray;
using pankey::Type::Array::toCharArray;

using pankey::Support::File::WindowsFile;
using pankey::Support::File::FileManager;
using pankey::Support::File::TextLoader;
using pankey::Support::File::ReadStatus;
using pankey::Support::File::statusName;
using pankey::Support::Image::BmpLoader;

namespace Px = pankey::Type::Pixel;

// Pieces are printed in sequence rather than concatenated, so no temporary
// CharArray is allocated per line.

static void printFormat(Px::PixelFormat a_format){
    if(a_format == Px::PixelFormat::BGR888){
        print(toCharArray("BGR888"));
        return;
    }
    if(a_format == Px::PixelFormat::BGRA8888){
        print(toCharArray("BGRA8888"));
        return;
    }
    print(toCharArray("Unknown"));
}

static void printYesNo(bool a_value){
    print(toCharArray(a_value ? "yes" : "no"));
}

// 1 - plain text written and streamed back from an absolute path.
static void exampleText(FileManager& a_files, const CharArray& a_dir){
    println();
    println(toCharArray("--- 1. text ---"));

    CharArray i_path = a_files.joinPath(a_dir, toCharArray("notes.txt"));

    print(toCharArray("path      : "));
    println(i_path);

    bool i_written = a_files.writeText(toCharArray("the pankey engine\n"), i_path);
    i_written = a_files.appendText(toCharArray("streams text in fixed chunks\n"), i_path) && i_written;
    i_written = a_files.appendText(toCharArray("so a microcontroller can read it\n"), i_path) && i_written;

    print(toCharArray("writeText : "));
    printYesNo(i_written);
    println();

    TextLoader i_loader(a_files);
    // A 16 byte chunk, deliberately smaller than every line.
    if(!i_loader.open(i_path, 16)){
        println(toCharArray("open failed"));
        return;
    }

    CharArray i_line;
    i_line.createArray(64);
    ReadStatus i_status = i_loader.nextLine(i_line);
    int i_number = 0;
    while(i_status != ReadStatus::End && i_status != ReadStatus::Error){
        print(toCharArray("line "));
        print(toCharArray(i_number));
        print(toCharArray(" ["));
        print(statusName(i_status));
        print(toCharArray("] "));
        println(i_line);
        i_number++;
        i_status = i_loader.nextLine(i_line);
    }
    i_loader.close();
}

// 2 - a whole float array as one binary blob, absolute path.
static void exampleFloatArray(FileManager& a_files, const CharArray& a_dir){
    println();
    println(toCharArray("--- 2. float array blob ---"));

    CharArray i_path = a_files.joinPath(a_dir, toCharArray("weights.bin"));

    FloatArray i_out;
    const int i_count = 512;
    i_out.createArray(i_count);
    for(int x = 0; x < i_count; x++){
        i_out.setFast(x, static_cast<float>(x) * 0.25f);
    }
    i_out.setLength(i_count);

    print(toCharArray("path      : "));
    println(i_path);

    print(toCharArray("saveArray : "));
    printYesNo(a_files.saveArray(i_path, i_out));
    print(toCharArray("   floats="));
    print(toCharArray(i_out.length()));
    print(toCharArray("  bytes="));
    println(toCharArray(static_cast<int>(i_out.length() * sizeof(float))));

    FloatArray i_in;
    const bool i_loaded = a_files.loadArray(i_path, i_in);
    print(toCharArray("loadArray : "));
    printYesNo(i_loaded);
    print(toCharArray("   floats="));
    println(toCharArray(i_in.length()));

    bool i_same = i_loaded && i_in.length() == i_out.length();
    for(int x = 0; i_same && x < i_in.length(); x++){
        i_same = i_in.get(x) == i_out.get(x);
    }
    print(toCharArray("round trip: "));
    print(toCharArray(i_same ? "identical" : "MISMATCH"));
    if(i_in.length() > 0){
        print(toCharArray("   first="));
        print(toCharArray(i_in.get(0), 2));
        print(toCharArray("  last="));
        print(toCharArray(i_in.get(i_in.length() - 1), 2));
    }
    println();
}

// 3 - absolute paths, the shared root, and the search chain.
static void examplePaths(FileManager& a_files, const CharArray& a_dir){
    println();
    println(toCharArray("--- 3. path resolution ---"));

    print(toCharArray("executable: "));
    println(a_files.executableDirectory());
    print(toCharArray("working   : "));
    println(a_files.workingDirectory());
    print(toCharArray("root      : "));
    println(a_files.root());

    CharArray i_absolute = a_files.joinPath(a_dir, toCharArray("notes.txt"));
    print(toCharArray("isAbsolute: "));
    printYesNo(a_files.isAbsolutePath(i_absolute));
    println();

    // Relative name, found through the root without any copy beside the exe.
    CharArray i_relative = a_files.joinPath(toCharArray("Examples"), toCharArray("notes.txt"));
    print(toCharArray("relative  : "));
    println(i_relative);
    print(toCharArray("resolve   : "));
    println(a_files.resolve(i_relative));
    print(toCharArray("rootPath  : "));
    println(a_files.rootPath(i_relative));
    print(toCharArray("exists    : "));
    printYesNo(a_files.exists(i_relative));
    println();
}

// 4 - an image, decoded one scanline at a time.
static void exampleImage(FileManager& a_files, const CharArray& a_dir){
    println();
    println(toCharArray("--- 4. image ---"));

    CharArray i_path = a_files.joinPath(a_dir, toCharArray("sample.bmp"));

    // A 4x3 24 bit bitmap, written by hand so the demo needs no assets.
    const int i_width = 4;
    const int i_height = 3;
    const int i_row_bytes = i_width * 3;
    const int i_padding = (4 - (i_row_bytes % 4)) % 4;

    if(a_files.openWrite(i_path)){
        a_files.writeArray(toCharArray("BM"), 2);
        a_files.write(static_cast<unsigned int>(54 + (i_row_bytes + i_padding) * i_height));
        a_files.write(static_cast<unsigned int>(0));
        a_files.write(static_cast<unsigned int>(54));
        a_files.write(static_cast<unsigned int>(40));
        a_files.write(i_width);
        a_files.write(i_height);
        a_files.write(static_cast<unsigned short>(1));
        a_files.write(static_cast<unsigned short>(24));
        for(int x = 0; x < 6; x++){
            a_files.write(static_cast<unsigned int>(0));
        }
        for(int y = 0; y < i_height; y++){
            for(int x = 0; x < i_width; x++){
                a_files.write(static_cast<unsigned char>(x * 60));
                a_files.write(static_cast<unsigned char>(y * 80));
                a_files.write(static_cast<unsigned char>(200));
            }
            for(int p = 0; p < i_padding; p++){
                a_files.write(static_cast<unsigned char>(0));
            }
        }
        a_files.close();
    }

    print(toCharArray("path      : "));
    println(i_path);

    BmpLoader i_image(a_files);
    if(!i_image.open(i_path)){
        println(toCharArray("open failed"));
        return;
    }

    print(toCharArray("size      : "));
    print(toCharArray(i_image.width()));
    print(toCharArray(" x "));
    println(toCharArray(i_image.height()));

    print(toCharArray("format    : "));
    printFormat(i_image.format());
    print(toCharArray("  bpp="));
    print(toCharArray(Px::bytesPerPixel(i_image.format())));
    print(toCharArray("  rowBytes="));
    print(toCharArray(i_image.rowBytes()));
    print(toCharArray("  bottomUp="));
    printYesNo(i_image.isBottomUp());
    println();

    // One scanline of memory, never the whole image.
    PixelArray i_row;
    i_row.createArray(i_image.rowBytes());
    print(toCharArray("row buffer: "));
    print(toCharArray(i_row.getSize()));
    print(toCharArray(" bytes, whole image would be "));
    println(toCharArray(i_image.rowBytes() * i_image.height()));

    ReadStatus i_status = i_image.nextRow(i_row);
    int i_number = 0;
    while(i_status == ReadStatus::Ok){
        print(toCharArray("row "));
        print(toCharArray(i_number));
        print(toCharArray("     : "));
        for(int x = 0; x + 2 < i_row.length(); x += 3){
            print(toCharArray("("));
            print(toCharArray(static_cast<int>(i_row.get(x + 2))));
            print(toCharArray(","));
            print(toCharArray(static_cast<int>(i_row.get(x + 1))));
            print(toCharArray(","));
            print(toCharArray(static_cast<int>(i_row.get(x))));
            print(toCharArray(") "));
        }
        println();
        i_number++;
        i_status = i_image.nextRow(i_row);
    }
    print(toCharArray("finished  : "));
    print(statusName(i_status));
    print(toCharArray(" after "));
    print(toCharArray(i_number));
    println(toCharArray(" rows"));
    i_image.close();
}

// 5 - GGUF metadata, read in place from the shared model folder.
static void exampleGGUF(FileManager& a_files, const CharArray& a_model){
    println();
    println(toCharArray("--- 5. gguf ---"));

    print(toCharArray("path      : "));
    println(a_files.rootPath(a_model));

    if(!a_files.rootExists(a_model)){
        println(toCharArray("model not found, skipping"));
        return;
    }

    if(a_files.rootRead(a_model)){
        print(toCharArray("file size : "));
        print(toCharArray(a_files.size()));
        println(toCharArray(" bytes"));
        a_files.close();
    }

    WindowsFile i_driver;
    pankey::FileSystem::BinaryFile i_binary(i_driver);
    if(!i_binary.openRead(a_files.rootPath(a_model))){
        println(toCharArray("open failed"));
        return;
    }

    pankey::FileSystem::GGUFModel i_model;
    const bool i_ok = pankey::FileSystem::GGUFFile::load(i_binary, i_model);
    i_binary.close();

    print(toCharArray("load      : "));
    printYesNo(i_ok);
    println();
    if(!i_ok){
        return;
    }

    print(toCharArray("version   : "));
    println(toCharArray(static_cast<int>(i_model.m_version)));
    print(toCharArray("metadata  : "));
    print(toCharArray(i_model.m_metadata_count));
    println(toCharArray(" entries"));
    print(toCharArray("tensors   : "));
    println(toCharArray(i_model.m_tensors.length()));
    print(toCharArray("data at   : "));
    print(toCharArray(i_model.m_tensor_data_offset));
    println(toCharArray(" bytes"));
    print(toCharArray("arch      : "));
    println(i_model.m_architecture);
    print(toCharArray("tokenizer : "));
    println(i_model.m_tokenizer_model);

    for(int x = 0; x < i_model.m_tensors.length() && x < 3; x++){
        print(toCharArray("tensor "));
        print(toCharArray(x));
        print(toCharArray("  : "));
        print(i_model.m_tensors.get(x).m_name);
        print(toCharArray("  dims=["));
        for(int d = 0; d < i_model.m_tensors.get(x).m_dimensions.length(); d++){
            if(d > 0){
                print(toCharArray(","));
            }
            print(toCharArray(i_model.m_tensors.get(x).m_dimensions.get(d)));
        }
        print(toCharArray("] type="));
        println(toCharArray(static_cast<int>(i_model.m_tensors.get(x).m_type)));
    }
}

void setup(){
    println(toCharArray("=== ThePankeyEngine file examples ==="));

    WindowsFile i_file;
    FileManager i_files(i_file);

    // Originals live here once. Nothing is copied per project.
    CharArray i_root = toCharArray("C:\\Users\\panke\\Documents\\ThePankeyEngine-CMake-Dev\\Data");
    CharArray i_dir = i_files.joinPath(i_root, toCharArray("Examples"));
    CharArray i_model = i_files.joinPath(
        toCharArray("AIModels"),
        toCharArray("Qwen2.5-7B-Instruct-Q4_K_M.gguf")
    );

    i_files.setRoot(i_root);
    i_files.createDir(i_dir);

    exampleText(i_files, i_dir);
    exampleFloatArray(i_files, i_dir);
    examplePaths(i_files, i_dir);
    exampleImage(i_files, i_dir);
    exampleGGUF(i_files, i_model);

    println();
    println(toCharArray("=== done ==="));
}

void loop(){

}
