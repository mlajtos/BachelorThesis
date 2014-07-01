import QtQuick 1.0

Text {
    id: time

    text: timer.time
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    font.pointSize: 20
    state: "inactive"

    signal reset

    onReset: timer.reset()

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
    }

    Timer {
        id: timer

        property string time: format(hours) + ":" + format(minutes) + ":" + format(seconds)
        property int seconds: 0
        property int minutes: 0
        property int hours: 0

        signal reset

        interval: 1000
        running: false
        repeat: true

        function format(n) {
            if (n < 10) {
                n = "0" + n
            }

            return n
        }

        onReset: {
            seconds = 0
            minutes = 0
            hours = 0

            timer.restart()
        }

        onTriggered: {
            seconds++

            if (seconds == 60) {
                seconds = 0
                minutes++
            }

            if (minutes == 60) {
                minutes = 0
                hours++
            }
        }
    }

    states: [
        State {
            name: "inactive"
            when: !mouse.containsMouse
            PropertyChanges {
                target: time
                opacity: 0.01
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation {
                property: "opacity"
                easing.type: Easing.InOutCubic
            }
        }
    ]
}

