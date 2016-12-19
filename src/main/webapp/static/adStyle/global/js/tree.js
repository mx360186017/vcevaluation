
    $(function()
    {
        var options = {
                placeholderCss: {'background-color': '#ff8'},
                hintCss: {'background-color':'#bbf'},
                isAllowed: function(cEl, hint, target)
                {
                    if(hint.parents('li').first().data('module') === 'c' && cEl.data('module') !== 'c')
                    {
                        hint.css('background-color', '#ff9999');
                        return false;
                    }
                    else
                    {
                        hint.css('background-color', '#99ff99');
                        return true;
                    }
                },
                opener: {
                    active: true,
                    close: 'images/Remove2.png',
                    open: 'images/Add2.png',
                    openerCss: {
                        'display': 'inline-block',
                        'width': '18px',
                        'height': '18px',
                        'float': 'left',
                        'margin-left': '-35px',
                        'margin-right': '5px',
                        'background-position': 'center center',
                        'background-repeat': 'no-repeat'
                    },
                    openerClass: ''
                }
            },

            sWrapper = $('#settingsWrapper');

        $('#sTree2, #sTree').sortableLists(options);

        $('#toArrBtn').on('click', function(){ console.log($('#sTree2').sortableListsToArray()); });
        $('#toHierBtn').on('click', function() { console.log($('#sTree2').sortableListsToHierarchy()); });
        $('#toStrBtn').on('click', function() { console.log($('#sTree2').sortableListsToString()); });
        $('.descPicture').on('click', function(e) { $(this).toggleClass('descPictureClose'); });
    });
