-- Made by Ahmad

if text and text:match("^calculate (.*)$") then
    local input = text:match("^calculate (.*)$")
    local years = 2025 - tonumber(input)
    local months = years * 12
    local weeks = months * 4
    local days = weeks * 7
    local hours = days * 24
    local minutes = hours * 60
    local seconds = minutes * 60
    local laughs = years * 3666
    local breaths = years * 7400000
    local sleep_years = years / 3
    local heart_beats = years * 4400000
    local eye_blinks = years * 421000
    local blood_pumped = years * 5300
    local eating_months = months / 6
    local eating_years = eating_months / 12

    return send(
        msg.chat_id,
        msg.id,
        "• Your age is approximate, not exact.\n" ..
        "- Age in years: " .. years .. "\n" ..
        "- Age in months: " .. months .. "\n" ..
        "- Age in weeks: " .. weeks .. "\n" ..
        "- Age in days: " .. days .. "\n" ..
        "- Age in hours: " .. hours .. "\n" ..
        "- Age in minutes: " .. minutes .. "\n" ..
        "- Age in seconds: " .. seconds .. " million\n" ..
        "- You laughed about: " .. laughs .. " thousand times\n" ..
        "- You breathed about: " .. breaths .. " million times\n" ..
        "- You slept about: " .. sleep_years .. " years\n" ..
        "- Your heart beat: " .. heart_beats .. " million times\n" ..
        "- Eye blinked: " .. eye_blinks .. " times\n" ..
        "- Amount of blood pumped by heart: " .. blood_pumped .. "\n" ..
        "- Time spent eating: " .. eating_years .. " years",
        "md",
        true
    )
end