exports('testegravida', function(data, slot)
    local playerPed = PlayerPedId()

    -- Use o teste de gravidez
    exports.ox_inventory:useItem(data, function(data)
        -- O item foi usado, então inicie o teste
        if data then
            -- Inicia a animação
            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_STAND_MOBILE", 0, true)
            
            -- Espera 5 segundos
            Wait(5000)
            
            -- Para a animação
            ClearPedTasks(playerPed)
            
            -- Mostra a NUI
            SendNUIMessage({
                action = 'show'
            })
            SetNuiFocus(true, true)
            
            -- Notifica o jogador
            TriggerEvent('chat:addMessage', {
                color = {255, 255, 0},
                multiline = true,
                args = {"Sistema", "Você usou o teste de gravidez"}
            })
        end
    end)
end)

-- Adicione este callback para fechar a NUI
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)