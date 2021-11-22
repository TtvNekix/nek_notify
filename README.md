💫TRIGGERS AND EXAMPLES

Notify TYPES are: "normal" // "correct" // "error" // "info"

Characteristics --> type: STRING // title: STRING // msg: STRING // time: INT (ms) // bar: BOOLEAN (true or false) // bar_value: INT (percentage of width of progressbar)

TriggerClientEvent('nek_notify:createTimerNotificaction', type, title, msg, time, bar, bar_value)

TriggerClientEvent('nek_notify:createNotificaction', type, title, msg, bar, bar_value)

TriggerClientEvent('nek_notify:closeNotification')

TriggerClientEvent('nek_notify:updateProgressBar', bar_value)
