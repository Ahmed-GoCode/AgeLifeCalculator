# AgeLifeCalculator 🎂

A comprehensive and well-documented Lua script that calculates your age in various time units and provides fascinating life statistics. From basic age calculations to fun estimates like heartbeats, steps walked, and words spoken, this calculator transforms your birth date into an engaging exploration of your life journey.

## Features ✨

- **Comprehensive Age Calculation**: Years, months, days, hours, minutes, and seconds
- **Biological Statistics**: Heartbeats, breaths, blinks, and sleep hours
- **Life Activity Estimates**: Steps walked, words spoken, meals eaten, and laughter
- **Fun Statistics**: Pizza slices eaten, books you could have read, movies watched, and more
- **Well-Documented Code**: Extensive comments and clear structure
- **Unit Tests**: Comprehensive test suite to ensure reliability
- **Interactive Interface**: User-friendly command-line interface
- **Number Formatting**: Large numbers formatted with commas for readability

## Requirements 📋

- Lua 5.3 or higher
- Standard Lua libraries (os, io)

## Installation 🚀

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Ahmed-GoCode/AgeLifeCalculator.git
   cd AgeLifeCalculator
   ```

2. **Make the script executable** (optional):
   ```bash
   chmod +x age_calculator.lua
   ```

## Usage 💻

### Interactive Mode

Run the calculator interactively by executing the script:

```bash
lua age_calculator.lua
```

You'll be prompted to enter your birth information:

```
🎂 Welcome to the Age & Life Calculator! 🎂
=========================================

Please enter your birth information:
Birth year (e.g., 1990): 1990
Birth month (1-12, press Enter for January): 5
Birth day (1-31, press Enter for 1st): 15

Calculating your life statistics...
```

### Example Output

```
🎂 AGE & LIFE STATISTICS CALCULATOR 🎂
=====================================
Birth Date: 1990-05-15

📅 YOUR AGE:
   • 35 years
   • 423 months
   • 12,901 days
   • 309,641 hours
   • 18,578,503 minutes
   • 1,114,710,200 seconds

💓 BIOLOGICAL STATISTICS:
   • Your heart has beaten 1,300,495,233 times
   • You have taken 297,256,053 breaths
   • You have blinked 278,677,550 times
   • You have walked approximately 96,763,038 steps
   • You have spoken about 206,427,814 words
   • You have slept for 103,213 hours
   • You have eaten 38,705 meals
   • You have laughed 193,526 times

🎉 FUN LIFE STATISTICS:
   • Birthdays celebrated: 35
   • Weekends enjoyed: 3,686
   • Sunrises witnessed: 12,901
   • Pizza slices eaten (estimated): 3,870
   • Books you could have read: 2,580
   • Movies you could have watched: 6,450
   • Hair grown (cm): 4,515
   • Times you've clipped your nails: 1,290

✨ Remember: Every moment is precious! ✨
```

### Programmatic Usage

You can also use the AgeCalculator as a module in your own Lua scripts:

```lua
local AgeCalculator = require("age_calculator")

-- Create calculator for someone born on May 15, 1990
local calc = AgeCalculator:new(1990, 5, 15)

-- Get basic age information
local age = calc:get_basic_age()
print("Age in years:", age.years)
print("Age in days:", age.days)

-- Get biological statistics
local bio_stats = calc:get_biological_stats()
print("Heartbeats:", bio_stats.heartbeats)
print("Steps walked:", bio_stats.steps_walked)

-- Get fun statistics
local fun_stats = calc:get_fun_stats()
print("Birthdays celebrated:", fun_stats.birthdays_celebrated)
print("Pizza slices eaten:", fun_stats.pizza_slices_eaten)

-- Generate complete report
local report = calc:generate_report()
print(report)
```

## API Reference 📚

### AgeCalculator:new(birth_year, birth_month, birth_day)

Creates a new AgeCalculator instance.

**Parameters:**
- `birth_year` (number): The birth year (required)
- `birth_month` (number, optional): Birth month (1-12, defaults to 1)
- `birth_day` (number, optional): Birth day (1-31, defaults to 1)

**Returns:** AgeCalculator instance

**Example:**
```lua
local calc = AgeCalculator:new(1990, 5, 15)  -- May 15, 1990
local calc2 = AgeCalculator:new(1990)        -- January 1, 1990
```

### calc:get_basic_age()

Returns basic age information in various time units.

**Returns:** Table with fields:
- `years` (number): Age in years
- `months` (number): Age in months
- `days` (number): Age in days
- `hours` (number): Age in hours
- `minutes` (number): Age in minutes
- `seconds` (number): Age in seconds

### calc:get_biological_stats()

Returns estimated biological statistics based on average rates.

**Returns:** Table with fields:
- `heartbeats` (number): Estimated total heartbeats
- `breaths` (number): Estimated total breaths
- `blinks` (number): Estimated total eye blinks
- `steps_walked` (number): Estimated steps walked
- `words_spoken` (number): Estimated words spoken
- `hours_slept` (number): Estimated hours slept
- `meals_eaten` (number): Estimated meals eaten
- `times_laughed` (number): Estimated times laughed

### calc:get_fun_stats()

Returns fun and interesting life statistics.

**Returns:** Table with fields:
- `birthdays_celebrated` (number): Number of birthdays
- `weekends_enjoyed` (number): Estimated weekends experienced
- `sunrises_witnessed` (number): Number of sunrises (one per day)
- `pizza_slices_eaten` (number): Estimated pizza slices consumed
- `books_could_have_read` (number): Estimated books that could have been read
- `movies_could_have_watched` (number): Estimated movies that could have been watched
- `hair_length_grown_cm` (number): Estimated hair growth in centimeters
- `nail_clippings` (number): Estimated times nails were clipped

### calc:generate_report()

Generates a comprehensive, formatted report with all statistics.

**Returns:** Formatted string containing all age and life statistics

### calc:format_number(num)

Formats large numbers with commas for better readability.

**Parameters:**
- `num` (number): Number to format

**Returns:** Formatted string with commas

## Testing 🧪

The project includes a comprehensive unit test suite to ensure reliability:

```bash
lua test_age_calculator.lua
```

This will run all tests and display results:

```
🧪 Starting Age Life Calculator Unit Tests 🧪
==================================================

🧪 Testing Calculator Creation:
✅ PASS: Calculator should be created successfully
✅ PASS: Birth year should be set correctly
...

==================================================
TEST SUMMARY
==================================================
Tests Run: 45
Tests Passed: 45
Tests Failed: 0

🎉 All tests passed! 🎉
```

## Statistical Assumptions 📊

The calculator uses the following average rates for biological and life statistics:

| Statistic | Rate | Source |
|-----------|------|---------|
| Heart rate | 70 beats/minute | Medical average for adults |
| Breathing rate | 16 breaths/minute | Medical average for adults |
| Blinking rate | 15 blinks/minute | Ophthalmological studies |
| Daily steps | 7,500 steps/day | Health organization recommendations |
| Words spoken | 16,000 words/day | Linguistic research averages |
| Sleep | 8 hours/day | Health recommendations |
| Meals | 3 meals/day | Standard meal pattern |
| Laughter | 15 times/day | Psychological research |
| Hair growth | 0.35 mm/day | Dermatological studies |

## File Structure 📁

```
AgeLifeCalculator/
├── age_calculator.lua      # Main calculator script
├── test_age_calculator.lua # Unit test suite
├── example_usage.lua       # Example usage demonstrations
└── README.md              # This documentation
```

## Example Scripts 🎯

### Running Examples

The `example_usage.lua` script demonstrates various ways to use the calculator programmatically:

```bash
lua example_usage.lua
```

This will show examples of:
- Basic usage with different birth date formats
- Accessing specific statistics
- Error handling
- Working with multiple people
- Number formatting

## Code Quality Features 🔧

- **Comprehensive Documentation**: Every function is documented with purpose, parameters, and return values
- **Error Handling**: Input validation and graceful error messages
- **Modular Design**: Object-oriented approach with clear separation of concerns
- **Consistent Coding Style**: Well-formatted code with meaningful variable names
- **Extensive Testing**: 45+ unit tests covering all functionality
- **Number Formatting**: Large numbers formatted for readability

## Contributing 🤝

Feel free to contribute to this project by:

1. Adding new fun statistics
2. Improving calculation accuracy
3. Enhancing the user interface
4. Adding new features
5. Fixing bugs
6. Improving documentation

## License 📄

This project is licensed under the MIT License.

## Author 👨‍💻

**Ahmed GoCode**
- GitHub: [Ahmed-GoCode](https://github.com/Ahmed-GoCode)

---

✨ *Remember: Every moment is precious!* ✨
