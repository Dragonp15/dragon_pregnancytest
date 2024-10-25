local ox_inventory = exports.ox_inventory

RegisterNetEvent('dragon_pregnancytest:useItem')
AddEventHandler('dragon_pregnancytest:useItem', function()
    local source = source
    local success = ox_inventory:RemoveItem(source, 'testegravida', 1)
    if success then
        TriggerClientEvent('dragon_pregnancytest:startTest', source)
    else
        TriggerClientEvent('dragon_pregnancytest:notifyFail', source)
    end
end)