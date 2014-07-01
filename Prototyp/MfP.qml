import QtQuick 1.0
import "BachelorThesis"

Item {
    width: 800
    height: 480

    Component.onCompleted: {
        //view.startPresentation()
    }

    Background {
        anchors.fill: parent
    }

    ZuiView {
        id: view
        anchors.fill: parent

        onBeginPresentation: {
            timer.reset()
        }

        focus: true
        Keys.onLeftPressed: previous()
        Keys.onRightPressed: next()
        Keys.onEscapePressed: Qt.quit()

        path: [0, 1, 2]
        Repeater {
            id: presentation
            model: Presentation {}
        }
    }

    Rectangle {
        width: 10
        height: 10
        color: "green"
        MouseArea {
            anchors.fill: parent
            onClicked: view.beginPresentation()
        }
    }

    Rectangle {
        width: 10
        height: 10
        x: 10
        color: "red"
        MouseArea {
            anchors.fill: parent
            onClicked: view.endPresentation()
        }
    }

    TimerWidget {
        id: timer
        color: "white"
    }

    NavigationMenu {
        ImageButton {
            source: "resources/icons/previous.svg"
            enabled: view.hasPrevious()
            onClicked: view.previous()
            height: 64
            width: 96
        }

        ImageButton {
            source: "resources/icons/next.svg"
            enabled: view.hasNext()
            onClicked: view.next()
            height: 64
            width: 96
        }
    }
}
