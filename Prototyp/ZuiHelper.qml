import QtQuick 1.0
import "ZUI.js" as Zooming

QtObject {
    property real rho: Math.SQRT2
    property real mu: Math.sqrt(6)
    property real velocity: 1.3

    property variant originPoint: c
    property real angle: Zooming.rad2degree(a)
    property real xScale: Math.max(view.width, view.height) / w
    property real yScale: xScale

    property real t: 0

    property real w0
    property real w1
    property real a0
    property real a1
    property variant c0: "0,0"
    property variant c1: "0,0"
    property real d: Zooming.distance(c0, c1)
    property real b0: (Math.pow(w1, 2) - Math.pow(w0, 2) + Math.pow(rho, 4) * Math.pow(d, 2)) / (2 * w0 * Math.pow(rho, 2) * d)
    property real b1: (Math.pow(w1, 2) - Math.pow(w0, 2) - Math.pow(rho, 4) * Math.pow(d, 2)) / (2 * w1 * Math.pow(rho, 2) * d)
    property real r0: Math.log(-b0 + Math.sqrt(Math.pow(b0, 2) + 1))
    property real r1: Math.log(-b1 + Math.sqrt(Math.pow(b1, 2) + 1))
    property real s: Math.sqrt(Math.pow(a1 - a0, 2) / Math.pow(mu, 2) + Math.pow(r1 - r0, 2) / Math.pow(rho, 2))
    property real u: (w0 / Math.pow(rho, 2)) * Zooming.cosh(r0) * Zooming.tanh((r1 - r0) * t / s + r0) - (w0 / Math.pow(rho, 2)) * Zooming.sinh(r0)
    property real w: (w0 * Zooming.cosh(r0) / Zooming.cosh((r1 - r0) * t / s + r0))
    property real a: (a1 - a0) * t / s + a0
    property variant c: Qt.vector3d(c0.x + (c1.x - c0.x) * u / d, c0.y + (c1.y - c0.y) * u / d, 0)

    signal animateTo(variant item)

    onAnimateTo: {
        console.log(item)
        var xRatio = view.width / item.width
        var yRatio = view.height / item.height
        var ratio = Math.min(xRatio, yRatio)
        var x = Math.max(view.width, view.height) / ratio

        var c_old = originPoint
        var w_old = w
        var a_old = a

        c0 = isNaN(c_old.x)?Qt.point(0,0):c_old
        w0 = isNaN(w_old)?parent.width:w_old
        a0 = isNaN(a_old)?0:a_old
        c1 = Zooming.center(item)
        w1 = x
        a1 = Zooming.degree2rad(item.rotation)

        animation.restart()
    }

    NumberAnimation on t {
        id: animation
        running: false
        from: 0; to: s
        duration: 1000 * s / velocity
        easing.type: "InOutQuad"
    }
}
