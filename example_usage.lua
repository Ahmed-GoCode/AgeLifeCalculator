#!/usr/bin/env lua5.3

--[[
    Example usage of the AgeLifeCalculator module
    
    This script demonstrates how to use the AgeCalculator class
    programmatically in your own Lua applications.
    
    Author: Ahmed GoCode
    Version: 1.0
--]]

-- Load the AgeCalculator module
local AgeCalculator = require("age_calculator")

print("🎂 AgeLifeCalculator - Example Usage 🎂")
print("======================================")
print()

-- Example 1: Basic usage with full birth date
print("📘 Example 1: Full birth date")
local calc1 = AgeCalculator:new(1990, 5, 15)
local age1 = calc1:get_basic_age()
print(string.format("Person born on 1990-05-15 is %d years and %d days old", 
                   age1.years, age1.days % 365))
print()

-- Example 2: Using only birth year (defaults to January 1st)
print("📘 Example 2: Birth year only")
local calc2 = AgeCalculator:new(2000)
local age2 = calc2:get_basic_age()
print(string.format("Person born in 2000 is %d years old", age2.years))
print()

-- Example 3: Getting biological statistics
print("📘 Example 3: Biological statistics")
local calc3 = AgeCalculator:new(1985, 8, 20)
local bio_stats = calc3:get_biological_stats()
print(string.format("Person born 1985-08-20 has approximately:"))
print(string.format("  • %s heartbeats", calc3:format_number(bio_stats.heartbeats)))
print(string.format("  • %s steps walked", calc3:format_number(bio_stats.steps_walked)))
print(string.format("  • %s words spoken", calc3:format_number(bio_stats.words_spoken)))
print()

-- Example 4: Fun statistics
print("📘 Example 4: Fun statistics")
local calc4 = AgeCalculator:new(1992, 11, 3)
local fun_stats = calc4:get_fun_stats()
print(string.format("Person born 1992-11-03 has:"))
print(string.format("  • Celebrated %d birthdays", fun_stats.birthdays_celebrated))
print(string.format("  • Enjoyed %s weekends", calc4:format_number(fun_stats.weekends_enjoyed)))
print(string.format("  • Could have read %s books", calc4:format_number(fun_stats.books_could_have_read)))
print()

-- Example 5: Error handling
print("📘 Example 5: Error handling")
local success, error_msg = pcall(function()
    AgeCalculator:new("invalid_year")
end)
if not success then
    print("✅ Error handling works: " .. error_msg)
end
print()

-- Example 6: Future birth date handling
print("📘 Example 6: Future birth date error")
local future_calc = AgeCalculator:new(2030, 1, 1)
local success2, error_msg2 = pcall(function()
    future_calc:get_basic_age()
end)
if not success2 then
    print("✅ Future date error handled: " .. error_msg2)
end
print()

-- Example 7: Generate a mini report for multiple people
print("📘 Example 7: Mini report for multiple people")
local people = {
    {name = "Alice", year = 1988, month = 3, day = 12},
    {name = "Bob", year = 1995, month = 7, day = 22},
    {name = "Charlie", year = 2001, month = 12, day = 5}
}

for _, person in ipairs(people) do
    local calc = AgeCalculator:new(person.year, person.month, person.day)
    local age = calc:get_basic_age()
    local bio = calc:get_biological_stats()
    
    print(string.format("%s (born %d-%02d-%02d):", 
                       person.name, person.year, person.month, person.day))
    print(string.format("  Age: %d years, %s heartbeats, %s steps", 
                       age.years, 
                       calc:format_number(bio.heartbeats),
                       calc:format_number(bio.steps_walked)))
end

print()
print("🎉 Examples completed successfully! 🎉")
print("Use 'lua age_calculator.lua' for the interactive version.")