local component = require("component");
local term = require("term");
local sides = require("sides");

local tspr = component.transposer;

local loop = true;

while loop do
    term.clear();
    print("-----");
    local current = tspr.getStackInSlot(sides.up, 1);
    if current == nil then
        print("No Current Destination")
    else
        print("Current Destination: " .. current.label);
    end
    print("-----");

    local emptyslot = nil;
    local destlist = {};
    local maxlinelen = 35;

    if tspr.getInventorySize(sides.front) == nil then
        print("ERROR: No Inventory Attached to Front!");
    else
        for i = 1, tspr.getInventorySize(sides.front) do
            local item = tspr.getStackInSlot(sides.front, i);
            if item ~= nil then
                -- print(item.label);
                local x = io.read()
                destlist[#destlist + 1] = item.label;
            else
                if emptyslot == nil then
                    emptyslot = i;
                end
            end
        end
        local x = io.read()
        if #destlist > 0 then
            print("Available Destinations: ");
            local currentindex = 1;
            while currentindex <= #destlist do
                local outputstr = "";
                while #outputstr < maxlinelen do
                    outputstr = outputstr .. "[" .. destlist[currentindex] .. "] ";
                    currentindex = currentindex + 1;
                    if currentindex <= #destlist then
                        break
                    end
                end
                print(outputstr);
            end
        end

        print("=====");
        print("Input Target");
        local input = io.read();
        if input == "exit" then
            loop = false;
        else
            for i = 1, tspr.getInventorySize(sides.front) do
                local item = tspr.getStackInSlot(sides.front, i);
                if item ~= nil and item.label == input then
                    tspr.transferItem(sides.up, sides.front, 1, 1, emptyslot);
                    emptyslot = nil;
                    tspr.transferItem(sides.front, sides.up, 1, i, 1)
                end
            end
        end
    end
end
