CreateThread(function()
    while true do
        for doorHashCFG, doorModel in pairs(XDoors) do
            local coords = GetEntityCoords(PlayerPedId())
            local prop = GetClosestObjectOfType(coords.x, coords.y, coords.z, 10.0, doorHashCFG, false, false, false)
            local x, y, z = table.unpack(GetEntityCoords(prop))
            SetEntityAsMissionEntity(prop, true, true)
            local onSystem, doorHash = DoorSystemFindExistingDoor(x, y, z, GetEntityModel(prop))
            if not onSystem then
                doorHash = GetHashKey(("_GATE_%d_CONTROLLER_%d"):format(GetEntityModel(prop), math.random(0, 81733)))
                AddDoorToSystem(doorHash, GetEntityModel(prop), x, y, z, false, false, false)
            end

            DoorSystemSetAutomaticDistance(doorHash, 4.5, false, true)
            DoorSystemSetAutomaticRate(doorHash, 4.5, false, true)
        end

        Wait(1500)
    end
end)