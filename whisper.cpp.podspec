Pod::Spec.new do |spec|
  spec.name         = "whisper.cpp"
  spec.version      = "1.6.0-readdle"
  spec.summary      = "Readdle fork of whisper.cpp"
  spec.description  = <<-DESC
                    High-performance inference of OpenAI's Whisper automatic speech recognition (ASR) model
                   DESC

  spec.homepage     = "https://github.com/readdle/whisper.cpp"

  spec.license = "MIT License"
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author = { "Viacheslav Savchenko" => "vs.savchenko@readdle.com" }

  spec.platforms = { :ios => "14.0", :osx => "10.15" }
  spec.source       = { :git => "git@github.com:readdle/whisper.cpp.git", :tag => "#{spec.version}" }

  spec.swift_version = '5.0'

  spec.module_name = 'whisper'

  spec.source_files  = 
    "ggml.c",
    "ggml.h",
    "whisper.cpp",
    "whisper.h",
    "ggml-alloc.c",
    "ggml-alloc.h",
    "ggml-backend.c",
    "ggml-backend.h",
    "ggml-quants.c",
    "ggml-quants.h",
    "ggml-impl.h",
    "ggml-backend-impl.h",
    "ggml-common.h",
    "ggml-metal.h",
    "ggml-metal.m"

  spec.exclude_files =
    "bindings",
    "cmake",
    "coreml",
    "examples",
    "extra",
    "models",
    "samples",
    "tests",
    "CMakeLists.txt",
    "ggml-cuda.cu",
    "ggml-cuda.h",
    "Makefile"

  spec.public_header_files =
    "whisper.h",
    "ggml.h"

  spec.preserve_path =
    "whisper-mel.hpp"

  spec.resource = "ggml-metal.metal"

  spec.frameworks = "Accelerate", "Metal", "MetalKit"
  
  spec.requires_arc = false

  spec.compiler_flags = 
    '-Wno-shorten-64-to-32',
    '-O3',
    '-DNDEBUG',
    '-DGGML_USE_ACCELERATE',
    '-DGGML_USE_METAL'

  spec.pod_target_xcconfig = { 
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++11",
    "WHISPER_METAL" => "YES"
  }

  spec.xcconfig = {
    "OTHER_LDFLAGS" => "-ObjC"
  }

end
