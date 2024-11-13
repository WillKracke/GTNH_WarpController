local component = require("component");
local sides = require("sides");

local tspr = component.transposer;

while true do
    print("-----");
    print("Current Dest: " .. tspr.getStackInSlot(sides.up, 1));
    print("-----");
    print("Available Destinations: ");
    for i = 1, tspr.getInventoryStorageSide(sides.front) do
        local item = tspr.getStackInSlot(sides.front, i);
        if not item == nil then
            print(item.label);
        end
    end

    print("=====");
    print("Input Target");
    local input = io.read();

end