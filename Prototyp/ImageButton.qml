import QtQuick 1.0

Image {
    sourceSize.width: width
    sourceSize.height: height
    opacity: enabled ? 1.0 : 0.3

    signal clicked

    MouseArea {
        anchors.fill: parent
        onClicked: parent.clicked()
    }

    Behavior on opacity {
        NumberAnimation {}
    }
}
