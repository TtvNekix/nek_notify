function Noti(type, title, msg, bar, barValue) 
    
    self = {}
    
    self.show = function()
        SendNUIMessage(
            {
                show = true,
                type = type,
                title = title,
                text = msg,
                bar = bar or false,
                bar_value = bar_value or 0
            }
        )
    end

    self.hide = function()
        SendNUIMessage(
            {
                show = false;
            }
        )
    end

    return self

end

RegisterNetEvent('nek_notify:createTimerNotificaction', function(type, title, msg, time, bar, bar_value)
    local noti = Noti(type, title, msg, bar, bar_value)
    noti.show()
    Wait(time)
    noti.hide()
end)

RegisterNetEvent('nek_notify:createNotificaction', function(type, title, msg, bar, bar_value)
    local noti = Noti(type, title, msg, bar, bar_value)
    noti.show()
end)

RegisterNetEvent('nek_notify:closeNotification', function()
    local noti = Noti()
    noti.close()
end)

RegisterNetEvent('nek_notify:updateProgressBar', function(percentage)
    SendNUIMessage({
        show = true;
        type = _type;
        title = _title;
        text = _msg;
        bar = _bar;
        bar_value = percentage;
    })
end)

RegisterCommand('testNotification',
    function()
        local noti = Noti("correct", "Test", "Hola que tal")
        noti.show()
    end
)