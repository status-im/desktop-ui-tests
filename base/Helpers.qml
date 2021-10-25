import QtQuick 2.14

QtObject {

    function checkClassName(item, name) {
        let stringy = item.toString()
        return stringy.indexOf(name) !== -1
    }

    function topChildAt(item, x, y) {
        var obj = item.childAt(x, y)
        if (!!obj) {
            for (var idx in obj.children) {
                var child = obj.children[idx]

                var position = mapToItem(child, x, y)
                if (position.x < 0 || position.y <= 0) {
                    continue
                } else {
                    return topChildAt(child, position.x, position.y)
                }
            }

            return obj
        }

        return null
    }

    function getObjectByObjectName(parent, objectName) {
        if (!parent) {
            return null;
        }

        if (parent.objectName === objectName) {
            return parent
        }
        for (var idx in parent.children) {
            var child = parent.children[idx]

            if (child.objectName === objectName) {
                return child;
            } else {
                var res = getObjectByObjectName(child, objectName)
                if (!!res) {
                    return res;
                }
            }
        }

        return null;
    }

    function findChildByClassName(item, className) {
        for (var idx in item.children) {
            let child = item.children[idx]
            let cname = child.toString();
            if (cname.indexOf(className) !== -1) {
                return child;
            }
        }

        return null;
    }

    function checkIfItemExists(parent, x, y, className) {
        var obj = parent.childAt(x, y)
        if (className !== undefined) {
            return !!obj && checkClassName(obj, className);
        } else {
            return !!obj
        }
    }
}
