let fileInput = document.querySelector('#file');
fileInput.onchange = function () {
    if (fileInput.files.length > 0) {
        var fileName = document.querySelector('.file .file-name');
        fileName.textContent = fileInput.files[0].name;
    }
}