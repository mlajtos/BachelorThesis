function distance(c0, c1) {
    return Math.sqrt(Math.pow(c1.x - c0.x, 2) + Math.pow(c1.y - c0.y, 2))
}

function cosh(arg) {
    return (Math.exp(arg) + Math.exp(-arg)) / 2;
}

function sinh(arg) {
    return (Math.exp(arg) - Math.exp(-arg)) / 2;
}

function tanh(arg) {
    return (Math.exp(arg) - Math.exp(-arg)) / (Math.exp(arg) + Math.exp(-arg));
}

function rad2degree(rad) {
    return rad * 180 / Math.PI
}

function degree2rad(degree) {
    return degree / 180 * Math.PI
}

function center(item) {
    return Qt.point(item.x + item.width / 2, item.y + item.height / 2)
}
