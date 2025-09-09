#!/usr/bin/env lua

--[[
    AgeLifeCalculator - A comprehensive age and life statistics calculator
    
    This script calculates your age in various units and provides fun life statistics
    based on your birth date. It includes calculations for time lived, biological
    processes, and interesting lifetime estimates.
    
    Author: Ahmed GoCode
    Version: 1.0
    License: MIT
--]]

-- Required modules
local os = require("os")

--[[
    AgeCalculator class - Main calculator for age and life statistics
--]]
local AgeCalculator = {}
AgeCalculator.__index = AgeCalculator

--[[
    Create a new AgeCalculator instance
    
    @param birth_year: The birth year (number)
    @param birth_month: The birth month (1-12, optional, defaults to 1)
    @param birth_day: The birth day (1-31, optional, defaults to 1)
    @return: AgeCalculator instance
--]]
function AgeCalculator:new(birth_year, birth_month, birth_day)
    if not birth_year or type(birth_year) ~= "number" then
        error("Birth year must be a valid number")
    end
    
    local obj = {
        birth_year = birth_year,
        birth_month = birth_month or 1,
        birth_day = birth_day or 1,
        current_time = os.time(),
        
        -- Constants for calculations (average values)
        SECONDS_PER_MINUTE = 60,
        MINUTES_PER_HOUR = 60,
        HOURS_PER_DAY = 24,
        DAYS_PER_YEAR = 365.25, -- Accounts for leap years
        DAYS_PER_MONTH = 30.44,  -- Average days per month
        
        -- Biological constants (average rates)
        HEARTBEATS_PER_MINUTE = 70,
        BREATHS_PER_MINUTE = 16,
        BLINKS_PER_MINUTE = 15,
        STEPS_PER_DAY = 7500,
        WORDS_SPOKEN_PER_DAY = 16000,
        HOURS_SLEPT_PER_DAY = 8,
        MEALS_PER_DAY = 3,
        LAUGHS_PER_DAY = 15
    }
    
    setmetatable(obj, self)
    return obj
end

--[[
    Calculate the birth timestamp
    
    @return: Birth timestamp in seconds since epoch
--]]
function AgeCalculator:get_birth_timestamp()
    return os.time({
        year = self.birth_year,
        month = self.birth_month,
        day = self.birth_day,
        hour = 0,
        min = 0,
        sec = 0
    })
end

--[[
    Calculate age in seconds
    
    @return: Age in seconds (number)
--]]
function AgeCalculator:get_age_in_seconds()
    local birth_time = self:get_birth_timestamp()
    return self.current_time - birth_time
end

--[[
    Calculate basic age information (years, months, days, hours, minutes, seconds)
    
    @return: Table containing age breakdown
--]]
function AgeCalculator:get_basic_age()
    local age_seconds = self:get_age_in_seconds()
    
    if age_seconds < 0 then
        error("Birth date cannot be in the future!")
    end
    
    local age_minutes = age_seconds / self.SECONDS_PER_MINUTE
    local age_hours = age_minutes / self.MINUTES_PER_HOUR
    local age_days = age_hours / self.HOURS_PER_DAY
    local age_months = age_days / self.DAYS_PER_MONTH
    local age_years = age_days / self.DAYS_PER_YEAR
    
    return {
        seconds = math.floor(age_seconds),
        minutes = math.floor(age_minutes),
        hours = math.floor(age_hours),
        days = math.floor(age_days),
        months = math.floor(age_months),
        years = math.floor(age_years)
    }
end

--[[
    Calculate fun biological statistics
    
    @return: Table containing biological statistics
--]]
function AgeCalculator:get_biological_stats()
    local age_minutes = self:get_age_in_seconds() / self.SECONDS_PER_MINUTE
    local age_days = age_minutes / self.MINUTES_PER_HOUR / self.HOURS_PER_DAY
    
    return {
        heartbeats = math.floor(age_minutes * self.HEARTBEATS_PER_MINUTE),
        breaths = math.floor(age_minutes * self.BREATHS_PER_MINUTE),
        blinks = math.floor(age_minutes * self.BLINKS_PER_MINUTE),
        steps_walked = math.floor(age_days * self.STEPS_PER_DAY),
        words_spoken = math.floor(age_days * self.WORDS_SPOKEN_PER_DAY),
        hours_slept = math.floor(age_days * self.HOURS_SLEPT_PER_DAY),
        meals_eaten = math.floor(age_days * self.MEALS_PER_DAY),
        times_laughed = math.floor(age_days * self.LAUGHS_PER_DAY)
    }
end

--[[
    Calculate additional fun statistics
    
    @return: Table containing additional fun statistics
--]]
function AgeCalculator:get_fun_stats()
    local age_days = self:get_age_in_seconds() / self.SECONDS_PER_MINUTE / self.MINUTES_PER_HOUR / self.HOURS_PER_DAY
    local age_years = age_days / self.DAYS_PER_YEAR
    
    return {
        birthdays_celebrated = math.floor(age_years),
        weekends_enjoyed = math.floor(age_days / 7 * 2), -- Approximately 2 weekend days per week
        sunrises_witnessed = math.floor(age_days),
        pizza_slices_eaten = math.floor(age_days * 0.3), -- Assuming 0.3 slices per day average
        books_could_have_read = math.floor(age_days / 5), -- Assuming 5 days per book
        movies_could_have_watched = math.floor(age_days / 2), -- Assuming one movie every 2 days
        hair_length_grown_cm = math.floor(age_days * 0.35), -- Hair grows ~0.35mm per day
        nail_clippings = math.floor(age_days / 10) -- Assuming nails clipped every 10 days
    }
end

--[[
    Format large numbers with commas for better readability
    
    @param num: Number to format
    @return: Formatted string with commas
--]]
function AgeCalculator:format_number(num)
    local formatted = tostring(num)
    -- Add commas to large numbers
    formatted = formatted:reverse():gsub("(%d%d%d)", "%1,"):reverse()
    if formatted:sub(1, 1) == "," then
        formatted = formatted:sub(2)
    end
    return formatted
end

--[[
    Generate a comprehensive age and life statistics report
    
    @return: Formatted string containing all statistics
--]]
function AgeCalculator:generate_report()
    local basic_age = self:get_basic_age()
    local bio_stats = self:get_biological_stats()
    local fun_stats = self:get_fun_stats()
    
    local report = {}
    
    -- Header
    table.insert(report, "🎂 AGE & LIFE STATISTICS CALCULATOR 🎂")
    table.insert(report, "=====================================")
    table.insert(report, string.format("Birth Date: %04d-%02d-%02d", self.birth_year, self.birth_month, self.birth_day))
    table.insert(report, "")
    
    -- Basic Age Information
    table.insert(report, "📅 YOUR AGE:")
    table.insert(report, string.format("   • %s years", self:format_number(basic_age.years)))
    table.insert(report, string.format("   • %s months", self:format_number(basic_age.months)))
    table.insert(report, string.format("   • %s days", self:format_number(basic_age.days)))
    table.insert(report, string.format("   • %s hours", self:format_number(basic_age.hours)))
    table.insert(report, string.format("   • %s minutes", self:format_number(basic_age.minutes)))
    table.insert(report, string.format("   • %s seconds", self:format_number(basic_age.seconds)))
    table.insert(report, "")
    
    -- Biological Statistics
    table.insert(report, "💓 BIOLOGICAL STATISTICS:")
    table.insert(report, string.format("   • Your heart has beaten %s times", self:format_number(bio_stats.heartbeats)))
    table.insert(report, string.format("   • You have taken %s breaths", self:format_number(bio_stats.breaths)))
    table.insert(report, string.format("   • You have blinked %s times", self:format_number(bio_stats.blinks)))
    table.insert(report, string.format("   • You have walked approximately %s steps", self:format_number(bio_stats.steps_walked)))
    table.insert(report, string.format("   • You have spoken about %s words", self:format_number(bio_stats.words_spoken)))
    table.insert(report, string.format("   • You have slept for %s hours", self:format_number(bio_stats.hours_slept)))
    table.insert(report, string.format("   • You have eaten %s meals", self:format_number(bio_stats.meals_eaten)))
    table.insert(report, string.format("   • You have laughed %s times", self:format_number(bio_stats.times_laughed)))
    table.insert(report, "")
    
    -- Fun Statistics
    table.insert(report, "🎉 FUN LIFE STATISTICS:")
    table.insert(report, string.format("   • Birthdays celebrated: %s", self:format_number(fun_stats.birthdays_celebrated)))
    table.insert(report, string.format("   • Weekends enjoyed: %s", self:format_number(fun_stats.weekends_enjoyed)))
    table.insert(report, string.format("   • Sunrises witnessed: %s", self:format_number(fun_stats.sunrises_witnessed)))
    table.insert(report, string.format("   • Pizza slices eaten (estimated): %s", self:format_number(fun_stats.pizza_slices_eaten)))
    table.insert(report, string.format("   • Books you could have read: %s", self:format_number(fun_stats.books_could_have_read)))
    table.insert(report, string.format("   • Movies you could have watched: %s", self:format_number(fun_stats.movies_could_have_watched)))
    table.insert(report, string.format("   • Hair grown (cm): %s", self:format_number(fun_stats.hair_length_grown_cm)))
    table.insert(report, string.format("   • Times you've clipped your nails: %s", self:format_number(fun_stats.nail_clippings)))
    table.insert(report, "")
    
    table.insert(report, "✨ Remember: Every moment is precious! ✨")
    
    return table.concat(report, "\n")
end

--[[
    Main function to run the calculator interactively
--]]
function main()
    print("🎂 Welcome to the Age & Life Calculator! 🎂")
    print("=========================================")
    print()
    
    -- Get user input
    print("Please enter your birth information:")
    
    io.write("Birth year (e.g., 1990): ")
    local birth_year = tonumber(io.read())
    
    io.write("Birth month (1-12, press Enter for January): ")
    local birth_month_input = io.read()
    local birth_month = birth_month_input == "" and 1 or tonumber(birth_month_input)
    
    io.write("Birth day (1-31, press Enter for 1st): ")
    local birth_day_input = io.read()
    local birth_day = birth_day_input == "" and 1 or tonumber(birth_day_input)
    
    -- Validate input
    local current_year = tonumber(os.date("%Y"))
    if not birth_year or birth_year < 1900 or birth_year > current_year then
        print("❌ Error: Please enter a valid birth year between 1900 and " .. current_year)
        return
    end
    
    if not birth_month or birth_month < 1 or birth_month > 12 then
        print("❌ Error: Please enter a valid birth month (1-12)")
        return
    end
    
    if not birth_day or birth_day < 1 or birth_day > 31 then
        print("❌ Error: Please enter a valid birth day (1-31)")
        return
    end
    
    print()
    print("Calculating your life statistics...")
    print()
    
    -- Create calculator and generate report
    local success, result = pcall(function()
        local calculator = AgeCalculator:new(birth_year, birth_month, birth_day)
        return calculator:generate_report()
    end)
    
    if success then
        print(result)
    else
        print("❌ Error: " .. result)
    end
end

-- Run main function if this script is executed directly (not when required as module)
if arg and arg[0] then
    -- Check if this script is being run directly
    local script_name = arg[0]:match("([^/\\]+)$") or arg[0]
    if script_name == "age_calculator.lua" then
        main()
    end
end

-- Export the AgeCalculator class for testing
return AgeCalculator