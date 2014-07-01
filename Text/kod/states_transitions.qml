Item {
    id: item
    state: "inactive"

    states: [
        State {
            name: "active"
            PropertyChanges {
                target: item
                opacity: 1.0
                scale: 1.0
            }
        },
        State {
            name: "inactive"
            PropertyChanges {
                target: item
                opacity: 0.5
                scale: 0.75
            }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            properties: "opacity, scale"
        }
    }
}
