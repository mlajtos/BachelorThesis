import QtQuick 1.0
import "ZUI.js" as Zooming

Item {
    id: rootItem

    signal animateToChild(int index)

    onAnimateToChild: {
        helper.animateTo(children[index])
    }

    ZuiHelper {
        id: helper
    }

    transform: [
        Rotation {
            id: rotationTransformation
        },
        Scale {
            id: scaleTransformation
        },
        Translate {
            id: translateTransformation
        }
    ]

    states: [
        State {
            name: "presentation"
            PropertyChanges {
                target: rootItem
                x: view.width / 2
                y: view.height / 2
            }
            PropertyChanges {
                target: rotationTransformation
                origin: helper.originPoint
                angle: isNaN(helper.angle)?0:-helper.angle
            }
            PropertyChanges {
                target: scaleTransformation
                origin: helper.originPoint
                xScale: isNaN(helper.xScale)?1:helper.xScale
                yScale: isNaN(helper.yScale)?1:helper.yScale
            }
            PropertyChanges {
                target: translateTransformation
                x: isNaN(helper.originPoint.x)?0:-helper.originPoint.x
                y: isNaN(helper.originPoint.y)?0:-helper.originPoint.y
            }
        }
    ]
}
