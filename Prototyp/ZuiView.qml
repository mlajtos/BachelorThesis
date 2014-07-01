import QtQuick 1.0

Item {
    id: view

    default property alias content: rootItem.children
    property int current: 0
    property variant path

    signal beginPresentation
    signal endPresentation
    signal next
    signal previous

    function isValid(path_index) {
        if (path_index >= 0 && path_index <= (path.length - 1)) {
            var child_index = path[path_index]

            if ((child_index >= 0) && (child_index <= content.length - 1)) {
                return true
            }
        }

        return false
    }

    function hasNext() {
        return isValid(current + 1)
    }

    function hasPrevious() {
        return isValid(current - 1)
    }

    onBeginPresentation: {
        rootItem.state = "presentation"
        rootItem.animateToChild(path[current])
    }

    onEndPresentation: {
        rootItem.state = ""
    }

    onNext: current += hasNext() ? 1: 0
    onPrevious: current -= hasPrevious() ? 1: 0
    onCurrentChanged: rootItem.animateToChild(path[current])

    Zuitem {
        id: rootItem
    }

    MouseArea {
        anchors.fill: parent
        drag.target: rootItem
    }
}
