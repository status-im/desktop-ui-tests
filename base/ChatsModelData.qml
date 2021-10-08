import QtQuick 2.14

QtObject {
    id: chatsModel
    property var ensView: QtObject {
        function isEnsVerified(author) {
            return true;
        }
    }

    function alias(author) {
        return "some alias"
    }
}
