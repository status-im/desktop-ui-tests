import QtQuick 2.14

import StatusQ.Core 0.1
import StatusQ.Conntrols 0.1

QtObject {
    id: root

    property var target: null

    property var header: null
    property var footer: null
    property var contentItem: null

    Component {
        id: headerComp
        QtObject {
            property StatusbBaseText title
            property StatusbBaseText subtitle
            property StatusRoundImage avatar
            property StatusFlatRoundButton closeBtn
            property var actionButton
        }
    }

    function findInFooter(objectName) {
        if (footer) {
           return __helpers.getObjectByObjectName(footer, objectName)
        }

        return null;
    }

    function findInContent(objectName) {
        if (contentItem) {
            return __helpers.getObjectByObjectName(contentItem, objectName)
        }

        return null
    }

    property Helpers __helpers: Helpers {}

    onTargetChanged: {
        if (target) {
            var hdr = __helpers.getObjectByObjectName(target.background, "statusModalHeader")
            var headerNew = headerComp.createObject()
            headerNew.title = __helpers.getObjectByObjectName(hdr, "headerTitle")
            headerNew.subtitle = __helpers.getObjectByObjectName(hdr, "headerSubTitle")
            headerNew.avatar = __helpers.getObjectByObjectName(hdr, "headerImage")
            headerNew.closeBtn = __helpers.getObjectByObjectName(hdr, "headerCloseButton")
            headerNew.actionButton = __helpers.getObjectByObjectName(hdr, "actionButtonLoader").item

            root.header = headerNew
            root.contentItem = target.contentItem
            root.footer = target.footer
        }
    }
}
