#!/usr/bin/env lua5.3

--[[
    Unit tests for AgeLifeCalculator
    
    This file contains simple unit tests to verify the functionality
    of the AgeCalculator class and its methods.
    
    Author: Ahmed GoCode
    Version: 1.0
    License: MIT
--]]

-- Load the AgeCalculator module
local AgeCalculator = require("age_calculator")

-- Simple test framework
local TestRunner = {}
TestRunner.__index = TestRunner

function TestRunner:new()
    local obj = {
        tests_run = 0,
        tests_passed = 0,
        tests_failed = 0,
        failures = {}
    }
    setmetatable(obj, self)
    return obj
end

function TestRunner:assert_equal(expected, actual, message)
    self.tests_run = self.tests_run + 1
    if expected == actual then
        self.tests_passed = self.tests_passed + 1
        print("✅ PASS: " .. (message or "Test"))
    else
        self.tests_failed = self.tests_failed + 1
        local failure_msg = string.format("❌ FAIL: %s\n   Expected: %s\n   Actual: %s", 
                                         message or "Test", tostring(expected), tostring(actual))
        print(failure_msg)
        table.insert(self.failures, failure_msg)
    end
end

function TestRunner:assert_true(condition, message)
    self:assert_equal(true, condition, message)
end

function TestRunner:assert_false(condition, message)
    self:assert_equal(false, condition, message)
end

function TestRunner:assert_not_nil(value, message)
    self.tests_run = self.tests_run + 1
    if value ~= nil then
        self.tests_passed = self.tests_passed + 1
        print("✅ PASS: " .. (message or "Test - value is not nil"))
    else
        self.tests_failed = self.tests_failed + 1
        local failure_msg = string.format("❌ FAIL: %s\n   Expected: not nil\n   Actual: nil", 
                                         message or "Test - value is not nil")
        print(failure_msg)
        table.insert(self.failures, failure_msg)
    end
end

function TestRunner:print_summary()
    print("\n" .. string.rep("=", 50))
    print("TEST SUMMARY")
    print(string.rep("=", 50))
    print(string.format("Tests Run: %d", self.tests_run))
    print(string.format("Tests Passed: %d", self.tests_passed))
    print(string.format("Tests Failed: %d", self.tests_failed))
    
    if self.tests_failed > 0 then
        print("\nFAILURES:")
        for i, failure in ipairs(self.failures) do
            print(string.format("%d. %s", i, failure))
        end
    end
    
    if self.tests_failed == 0 then
        print("\n🎉 All tests passed! 🎉")
    else
        print(string.format("\n❌ %d test(s) failed!", self.tests_failed))
    end
end

-- Test functions
function test_calculator_creation(runner)
    print("\n🧪 Testing Calculator Creation:")
    
    -- Test basic creation
    local calc = AgeCalculator:new(1990, 5, 15)
    runner:assert_not_nil(calc, "Calculator should be created successfully")
    runner:assert_equal(1990, calc.birth_year, "Birth year should be set correctly")
    runner:assert_equal(5, calc.birth_month, "Birth month should be set correctly")
    runner:assert_equal(15, calc.birth_day, "Birth day should be set correctly")
    
    -- Test creation with defaults
    local calc_default = AgeCalculator:new(1990)
    runner:assert_equal(1990, calc_default.birth_year, "Birth year should be set correctly with defaults")
    runner:assert_equal(1, calc_default.birth_month, "Birth month should default to 1")
    runner:assert_equal(1, calc_default.birth_day, "Birth day should default to 1")
    
    -- Test error handling
    local success, error_msg = pcall(function()
        AgeCalculator:new("invalid")
    end)
    runner:assert_false(success, "Should error with invalid birth year")
    
    local success2, error_msg2 = pcall(function()
        AgeCalculator:new(nil)
    end)
    runner:assert_false(success2, "Should error with nil birth year")
end

function test_age_calculations(runner)
    print("\n🧪 Testing Age Calculations:")
    
    -- Create a calculator for someone born exactly 30 years ago
    local current_time = os.time()
    local thirty_years_ago = current_time - (30 * 365.25 * 24 * 60 * 60)
    local birth_date = os.date("*t", thirty_years_ago)
    
    local calc = AgeCalculator:new(birth_date.year, birth_date.month, birth_date.day)
    local basic_age = calc:get_basic_age()
    
    -- Test that age is approximately 30 years (within 1 year tolerance)
    runner:assert_true(basic_age.years >= 29 and basic_age.years <= 31, 
                      "Age should be approximately 30 years")
    
    -- Test that we have reasonable values for other time units
    runner:assert_true(basic_age.days > 10000, "Should have more than 10000 days")
    runner:assert_true(basic_age.hours > 200000, "Should have more than 200000 hours")
    runner:assert_true(basic_age.minutes > 10000000, "Should have more than 10 million minutes")
end

function test_biological_stats(runner)
    print("\n🧪 Testing Biological Statistics:")
    
    local calc = AgeCalculator:new(2000, 1, 1)  -- Born in year 2000
    local bio_stats = calc:get_biological_stats()
    
    -- Test that all biological stats are positive numbers
    runner:assert_true(bio_stats.heartbeats > 0, "Heartbeats should be positive")
    runner:assert_true(bio_stats.breaths > 0, "Breaths should be positive")
    runner:assert_true(bio_stats.blinks > 0, "Blinks should be positive")
    runner:assert_true(bio_stats.steps_walked > 0, "Steps walked should be positive")
    runner:assert_true(bio_stats.words_spoken > 0, "Words spoken should be positive")
    runner:assert_true(bio_stats.hours_slept > 0, "Hours slept should be positive")
    runner:assert_true(bio_stats.meals_eaten > 0, "Meals eaten should be positive")
    runner:assert_true(bio_stats.times_laughed > 0, "Times laughed should be positive")
    
    -- Test reasonable proportions (heartbeats should be much more than breaths)
    runner:assert_true(bio_stats.heartbeats > bio_stats.breaths, 
                      "Should have more heartbeats than breaths")
end

function test_fun_stats(runner)
    print("\n🧪 Testing Fun Statistics:")
    
    local calc = AgeCalculator:new(2000, 1, 1)  -- Born in year 2000
    local fun_stats = calc:get_fun_stats()
    
    -- Test that all fun stats are non-negative
    runner:assert_true(fun_stats.birthdays_celebrated >= 0, "Birthdays should be non-negative")
    runner:assert_true(fun_stats.weekends_enjoyed >= 0, "Weekends should be non-negative")
    runner:assert_true(fun_stats.sunrises_witnessed >= 0, "Sunrises should be non-negative")
    runner:assert_true(fun_stats.pizza_slices_eaten >= 0, "Pizza slices should be non-negative")
    runner:assert_true(fun_stats.books_could_have_read >= 0, "Books should be non-negative")
    runner:assert_true(fun_stats.movies_could_have_watched >= 0, "Movies should be non-negative")
    runner:assert_true(fun_stats.hair_length_grown_cm >= 0, "Hair length should be non-negative")
    runner:assert_true(fun_stats.nail_clippings >= 0, "Nail clippings should be non-negative")
end

function test_number_formatting(runner)
    print("\n🧪 Testing Number Formatting:")
    
    local calc = AgeCalculator:new(1990, 1, 1)
    
    -- Test basic number formatting
    runner:assert_equal("1,000", calc:format_number(1000), "Should format 1000 with comma")
    runner:assert_equal("1,000,000", calc:format_number(1000000), "Should format 1000000 with commas")
    runner:assert_equal("123", calc:format_number(123), "Should not add comma to small numbers")
    runner:assert_equal("0", calc:format_number(0), "Should handle zero")
end

function test_birth_timestamp(runner)
    print("\n🧪 Testing Birth Timestamp:")
    
    local calc = AgeCalculator:new(2000, 1, 1)
    local timestamp = calc:get_birth_timestamp()
    
    -- Test that we get a valid timestamp
    runner:assert_true(timestamp > 0, "Birth timestamp should be positive")
    
    -- Test that the timestamp corresponds to the correct date
    local date_from_timestamp = os.date("*t", timestamp)
    runner:assert_equal(2000, date_from_timestamp.year, "Timestamp should correspond to birth year")
    runner:assert_equal(1, date_from_timestamp.month, "Timestamp should correspond to birth month")
    runner:assert_equal(1, date_from_timestamp.day, "Timestamp should correspond to birth day")
end

function test_future_birth_date(runner)
    print("\n🧪 Testing Future Birth Date Error:")
    
    -- Test that calculator handles future birth dates appropriately
    local future_year = tonumber(os.date("%Y")) + 1
    local calc = AgeCalculator:new(future_year, 1, 1)
    
    local success, error_msg = pcall(function()
        calc:get_basic_age()
    end)
    
    runner:assert_false(success, "Should error when birth date is in the future")
end

function test_report_generation(runner)
    print("\n🧪 Testing Report Generation:")
    
    local calc = AgeCalculator:new(1990, 5, 15)
    local report = calc:generate_report()
    
    -- Test that report is a string and contains expected sections
    runner:assert_equal("string", type(report), "Report should be a string")
    runner:assert_true(string.find(report, "AGE & LIFE STATISTICS") ~= nil, 
                      "Report should contain title")
    runner:assert_true(string.find(report, "YOUR AGE:") ~= nil, 
                      "Report should contain age section")
    runner:assert_true(string.find(report, "BIOLOGICAL STATISTICS:") ~= nil, 
                      "Report should contain biological stats section")
    runner:assert_true(string.find(report, "FUN LIFE STATISTICS:") ~= nil, 
                      "Report should contain fun stats section")
    runner:assert_true(string.find(report, "1990%-05%-15") ~= nil, 
                      "Report should contain birth date")
end

-- Main test runner
function run_all_tests()
    print("🧪 Starting Age Life Calculator Unit Tests 🧪")
    print(string.rep("=", 50))
    
    local runner = TestRunner:new()
    
    -- Run all test functions
    test_calculator_creation(runner)
    test_age_calculations(runner)
    test_biological_stats(runner)
    test_fun_stats(runner)
    test_number_formatting(runner)
    test_birth_timestamp(runner)
    test_future_birth_date(runner)
    test_report_generation(runner)
    
    -- Print summary
    runner:print_summary()
    
    -- Return exit code based on test results
    return runner.tests_failed == 0 and 0 or 1
end

-- Run tests if this script is executed directly
if arg and arg[0] and arg[0]:match("test_age_calculator%.lua$") then
    os.exit(run_all_tests())
end

-- Export test runner for external use
return {
    TestRunner = TestRunner,
    run_all_tests = run_all_tests
}