import QtQuick 1.0

VisualItemModel {
    Slide {
        x: 0; y: 0
        Text {
            anchors.centerIn: parent
            text: "Prvý slajd"
            font.pixelSize: 30
        }
    }

    Slide {
        x: width * 1.2; y: 0
        rotation: 180
        Text {
            anchors.centerIn: parent
            text: "Druhý slajd"
            font.pixelSize: 30
        }
    }

    Item {
        width: 640 + 640 + 320
        height: 480
    }
}
