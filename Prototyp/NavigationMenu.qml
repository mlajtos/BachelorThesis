import QtQuick 1.0

Item {
    id: navigation

    default property alias content: row.children
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    width: row.width
    height: row.height

    MouseArea {
        id: mouse
        hoverEnabled: true
        anchors.fill: parent
    }

    Row {
        id: row
    }

    states: [
        State {
            name: "inactive"
            when: !mouse.containsMouse
            PropertyChanges {
                target: navigation
                opacity: 0.01
            }
            PropertyChanges {
                target: navigation
                anchors.margins: - navigation.height / 2
            }
        }
    ]

    transitions: [
        Transition {
            to: "inactive"
            SequentialAnimation {
                PauseAnimation {
                    duration: 400
                }
                NumberAnimation {
                    properties: "opacity,margins"
                    easing.type: Easing.InOutQuad
                }
            }
        },
        Transition {
            from: "inactive"
            NumberAnimation {
                properties: "opacity,margins"
                easing.type: Easing.InOutQuad
            }
        }
    ]
}
