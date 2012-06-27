function onBeforeUpload() {
    var uploader = $au.uploader(uploaderID),
        file = uploader.files().get(0);
    if (file) {
        var cropBounds = file.cropBounds();
        var width = cropBounds[2],
            height = cropBounds[3],
            ratio;
        if (width < height) {
            ratio = width / height;
        } else {
            ratio = height / width;
        }
        if (Math.abs(ratio - 3 / 4) > 0.005) {
            uploader.informationBar().show(
                'Aspect ratio of the image does not meet the requirements. Please open the image editor and crop the image.',
                'message');
            return false;
        }
    }
}

function onUploadFileCountChange() {
    var uploader = $au.uploader(uploaderID),
        file = uploader.files().get(0);
    if (file) {
        var cropBounds = file.cropBounds();
        var width = cropBounds[2] || file.width(),
            height = cropBounds[3] || file.height(),
            ratio;
        if (width < height) {
            ratio = width / height;
        } else {
            ratio = height / width;
        }
        if (Math.abs(ratio - 3 / 4) > 0.005) {
            uploader.imageEditor().show(0);
        }
    }
}