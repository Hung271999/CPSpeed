$(document).ready(function () {
    CKEDITOR.replace("description");
    $("#FileUpload").click(function () {
        var finder = new CKFinder();
        finder.selectActionFunction = function (fileUrl) {
            $("#fileInput").val(fileUrl);
        };
        finder.popup();
    });
});
//$(document).ready(function () {
//    CKEDITOR.replace("Title");    
//});
//$(document).ready(function () {
//    CKEDITOR.replace("Summary");
//});
$(document).ready(function () {
    CKEDITOR.replace("Content");
});
