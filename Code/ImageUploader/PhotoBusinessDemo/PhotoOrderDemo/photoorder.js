/// <reference path="aurigma.uploader.js" />

var orderDetails = {};

function onSelectionChanged() {
    ///	<summary>
    ///		SelectionChange event handler
    ///	</summary>
    var selectedFiles = getSelectedFiles(this),
        index,
        guid = '',
        count = selectedFiles.length;

    if (count > 0) {
        index = selectedFiles[0];
        guid = this.files().get(index).guid();

        // Check if order detaiols are the same for all selected files
        if (count > 1) {
            var od1 = orderDetails[guid];
            for (var i = 1; i < count; i++) {
                index = selectedFiles[i];
                guid = this.files().get(index).guid();
                var od2 = orderDetails[guid];
                if (!compareOrderDetails(od1, od2)) {
                    break;
                }
            }
            if (i != count) {
                guid = '';
            }
        }
    }

    setForm(guid);

    // Update image on thumbnail control
    if (count == 1) {
        // Show selected image
        th.guid(guid);
    } else {
        // Show nothing
        th.guid('');
    }

    // Change prev, next buttons state
    if (count == 0 && this.files().count() > 0) {
        $('.nav a').removeClass('disabled');
    } else if (count == 1) {
        $('.nav a').removeClass('disabled');
        if (selectedFiles[0] == 0) {
            $('.nav a.nav-prev').addClass('disabled');
        }
        if (selectedFiles[0] == this.files().count() - 1) {
            $('.nav a.nav-next').addClass('disabled');
        }
    } else {
        $('.nav a').addClass('disabled');
    }
}

function onBeforeUpload() {
    ///	<summary>
    ///		BeforeUpload event handler
    ///	</summary>
    var missingFiles = [], // Files with unspecified order details
        fileIndex;

    for (var i = 0, imax = this.files().count(); i < imax; i++) {
        var file = this.files().get(i);
        var value = orderDetails[file.guid()];
        if (value) {
        	var a = [];
        	a.push(encodeURIComponent('Size') + '=' + encodeURIComponent(value.Size));
        	a.push(encodeURIComponent('Paper') + '=' + encodeURIComponent(value.Paper));
        	a.push(encodeURIComponent('Quantity') + '=' + encodeURIComponent(value.Quantity));
            value = a.join('&').replace(/%20/g, '+');
        } else {
            // No order details for the file
            missingFiles.push(file.name());
            value = '';
        }

        // Put order details to the tag property
        file.tag(value);
    }
    
    if (missingFiles.length > 0) {
        alert('Please, specify order details for all selected to upload files');
        return false;
    }
}

function compareOrderDetails(od1, od2) {
    ///	<summary>
    ///		Compare two order details objects
    ///	</summary>
    ///	<param name="od1" type="Object" />
    /// <param name="od2" type="Object" />    
    ///	<returns type="Boolean">
    ///     Returns true if objects are the same, otherwise false
    /// </returns>
    var res = false;
    if (!od1 || !od2) {
        // empty values
        res = !od1 && !od2;
    } else {
        res = true;
        for (var name in od1) {
            if (!od1.hasOwnProperty || od1.hasOwnProperty(name) && od2.hasOwnProperty(name)) {
                res &= od1[name] == od2[name];
            } else {
                res = false;
            }

            if (!res) {
                break;
            }
        }
    }
    return res;
}

function getSelectedFiles(uploader) {
    ///	<summary>
    ///		Get indexes of the selected files
    ///	</summary>
    ///	<param name="uploader" type="$au.uploader">
    ///     Uploader object
    ///	</param>
    ///	<returns type="Array">
    ///     Returns array of the indexes of selected files
    /// </returns>
    var selectedFiles = [], files = uploader.files();
    for (var i = 0, imax = files.count(); i < imax; i++) {
        // Add index to the list if file is selected
        if (files.get(i).selected()) {
            selectedFiles.push(i);
        }
    }

    return selectedFiles;
}

function itemChange(applyToAll) {
    ///	<summary>
    ///		Called when user changes some order settings
    /// (like format name, paper type or amount of items).
    /// If 'applyToAll' parameter is true, then order
    /// details applies to all images in upload pane.
    ///	</summary>
    var uploader = u;
    if (uploader) {
        var values = {},
            sizeEl = document.getElementById('size'),
            paperEl = document.getElementById('paper'),
            quantityEl = document.getElementById('quantity');

        values.Size = sizeEl.selectedIndex > -1 ?
            sizeEl.options[sizeEl.selectedIndex].value : null;
        values.Paper = paperEl.selectedIndex > -1 ?
            paperEl.options[paperEl.selectedIndex].value : null;
        values.Quantity = quantityEl.value;

        if (!values.Size || !values.Paper || !values.Quantity) {
            values = null;
        }

        var formattedValues = getFormatted(values);

        for (var i = 0, imax = uploader.files().count(); i < imax; i++) {
            if (applyToAll || uploader.files().get(i).selected()) {
                var guid = uploader.files().get(i).guid();
                orderDetails[guid] = values;
                uploader.files().get(i).tileTemplate(formattedValues);
            }
        }
    }
}

function getFormatted(values) {
    ///	<summary>
    ///		Format order details to show in description
    ///	</summary>
    var s = [];
    for (var i in values) {
        s.push('<p><span width="60" style="color:#555555;">' + i + ': </span><span style="font-weight: bold;">' + values[i] + '</span></p>');
    }
    return s.join('') || '<p></p>';
}

function setForm(fileGuid) {
    ///	<summary>
    ///	    Set values to order details form
    ///	</summary>
    var sizeEl = document.getElementById('size'),
        paperEl = document.getElementById('paper'),
        quantityEl = document.getElementById('quantity');

    function setSelectField(element, value) {
        var opts = element.options;
        element.selectedIndex = -1;
        for (var i = 0, imax = opts.length; i < imax; i++) {
            var opt = opts[i];
            if (opt.value == value) {
                element.selectedIndex = i;
                break;
            }
        }
    }

    if (fileGuid && orderDetails[fileGuid]) {
        values = orderDetails[fileGuid];
    } else {
        values = {};
    }

    setSelectField(sizeEl, values.Size);
    setSelectField(paperEl, values.Paper);
    quantityEl.value = values.Quantity != null ? values.Quantity : 1;
}

function filterQuantity(e) {
    ///	<summary>
    ///	    Allow to input only digits in Quantity field
    ///	</summary>
    e = e || window.event;
    if (e.keyCode == 38) {
        changeQuantity(+1);
        return false;
    } else if (e.keyCode == 40) {
        changeQuantity(-1);
        return false;
    } else {
        var keyCode = e.charCode != null ? e.charCode : e.keyCode;
        if ((keyCode == null) || (keyCode == 0) || (keyCode == 8) || (keyCode == 9)
            || (keyCode == 13) || (keyCode == 27)) {
            return true;
        }
        if (keyCode >= '0'.charCodeAt(0) && keyCode <= '9'.charCodeAt(0)) {
            return true;
        } else {
            return false;
        }
    }
}

function changeQuantity(n) {
    ///	<summary>
    ///	    Up/Down quantity buttons handler
    ///	</summary>
    var qtt = document.getElementById("quantity"), val = qtt ? qtt.value : 0;
    val = parseInt(val) || 0;
    val = val + n;
    val = val < 1 ? 1 : val;
    val = val > 999 ? 999 : val;
    qtt.value = val;
    itemChange();
}

function startUpload() {
    ///	<summary>
    ///	    Start upload
    ///	</summary>
    u.upload();
}

function addFiles() {
    ///	<summary>
    ///	    Show add files dialog window
    ///	</summary>
    u.uploadPane().addFiles();
}

function onUploadFileCountChange() {
    ///	<summary>
    ///	    UploadFileCount event handler
    ///     Enable/disable Upload button and navigation buttons
    ///	</summary>
    var count = this.files().count();
    if (count > 0) {
        $('#phoUpload').attr('disabled', '').css('font-weight', 'bold');
        $('#phoApplyAll').attr('disabled', '');
        $('.nav a').removeClass('disabled');
    } else {
        $('#phoUpload').attr('disabled', 'disabled').css('font-weight', 'normal');
        $('#phoApplyAll').attr('disabled', 'disabled');
        $('.nav a').addClass('disabled');
    }
    for (var i = 0; i < count; i++) {
        var fileGuid = this.files().get(i).guid();
        if (orderDetails[fileGuid]) {
            this.files().get(i).tileTemplate(getFormatted(orderDetails[fileGuid]));
        }
    }
}

function changeThumbnail(offset) {
    ///	<summary>
    ///	    This function is called when the user clicks prev or next links.
    ///     It moves selection to the previous or next image in upload pane.
    ///	</summary>
    
    if (u.files().count() == 0) {
        return;
    }

    var selectedIndex = null, newSelectedIndex, fileCount = u.files().count();

    var selectedFiles = getSelectedFiles(u);

    if (selectedFiles.length == 0) {
        // if there isn't selected files
        if (offset < 0) {
            // if click 'prev' then select last file
            newSelectedIndex = fileCount - 1;
        } else {
            // if click 'next' then select first file
            newSelectedIndex = 0;
        }
        u.files().get(newSelectedIndex).selected(true);
    } else if (selectedFiles.length == 1) { // If one file selected
        selectedIndex = selectedFiles[0];
        newSelectedIndex = selectedIndex + offset;

        if (newSelectedIndex >= 0 && newSelectedIndex < fileCount) {
            u.files().get(selectedIndex).selected(false);
            u.files().get(newSelectedIndex).selected(true);
        }
    }
} 