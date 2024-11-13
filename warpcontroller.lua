local component = require("component");
local sides = require("sides");

local tspr = component.transposer;

while true do
    print("-----");
    local current = tspr.getStackInSlot(sides.up, 1);
    if current == nil then
        print("No Current Destination")
    else
        print("Current Destination: " .. current.label);
    end
    print("-----");
    print("Available Destinations: ");
    if tspr.getInventoryStorageSize(sides.front) == nil then
        print("ERROR: No Inventory Attached to Front!")
    else
        for i = 1, tspr.getInventoryStorageSize(sides.up) do
            local item = tspr.getStackInSlot(sides.up, i);
            if not item == nil then
                print(item.label);
            end
        end
    end

    print("=====");
    print("Input Target");
    local input = io.read();

end