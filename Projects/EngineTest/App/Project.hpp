#pragma once

#include "log.hpp"

#include "EnginePrinter.hpp"
#include "EngineTestPrint.hpp"

#include "TestRegistry.hpp"

#include "iFile_Windows_Testing.hpp"
#include "DefaultSettings_Testing.hpp"
#include "DataStructure_PrimitiveArrayRawPointerMap_Testing.hpp"
#include "Type_Array_Testing.hpp"

using namespace pankey::Utility::Test;

void setup(){
    println("Test started.");
    TestRegistry& i_test_registry = pankey_test_registry();
    TestRunner i_test_runner;
    i_test_registry.run(i_test_runner);
    i_test_runner.errors(TestPrintErrors);
    i_test_runner.result(TestPrintResult);

    println("Test complete.");
}

void loop(){

}
