CKEDITOR.editorConfig = function(config) {

 // Base config page for CKEditor in MyEditor.asp. 
 config.autoParagraph = true;
 config.forceEnterMode = true;
 config.toolbar = [
    { name: 'clipboard',   items: [ 'Undo','Redo' ] },
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
    { name: 'links',       items: [ 'Link','Unlink','Anchor' ] },
    '/',
    { name: 'styles',      items: [ 'Styles','Format','Font','FontSize' ] },
    { name: 'colors',      items: [ 'TextColor','BGColor' ] },
    { name: 'insert',      items: [ 'Table','HorizontalRule','Smiley','SpecialChar','PageBreak' ] },
 ];

};

