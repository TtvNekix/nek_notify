local _type, _title, _msg, _bar, _bar_value = nil, nil, nil, nil, nil

function Noti(type, title, msg, bar, bar_value) 
    _type = type
    _title = title
    _msg = msg
    _bar = bar
    _bar_value = bar_value
    SendNUIMessage({
        show = true;
        type = type;
        title = title;
        text = msg;
        bar = bar or false;
        bar_value = bar_value or 0;
    })
end

RegisterCommand('closetest', function()
    CloseNoti()
end)

RegisterCommand('testnoti', function(src, args)
    Noti(args[1], "Test Notify", "Testing a very hot notification...", true, args[2])
end)

function CloseNoti()
    SendNUIMessage({
        show = false;
    })
end

RegisterNetEvent('nek_notify:createTimerNotificaction', function(type, title, msg, time, bar, bar_value)
    Noti(type, title, msg, bar, bar_value)
    Wait(time)
    CloseNoti()
end)

RegisterNetEvent('nek_notify:createNotificaction', function(type, title, msg, bar, bar_value)
    Noti(type, title, msg, bar, bar_value)
end)

RegisterNetEvent('nek_notify:closeNotification', function()
    CloseNoti()
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