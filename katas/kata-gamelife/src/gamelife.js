function neighbors(grid, i, j) {
    return grid[i - 1][j - 1] +
        grid[i - 1][j] +
        grid[i - 1][j + 1] +

        grid[i][j - 1] +
        grid[i][j + 1] +

        grid[i + 1][j - 1] +
        grid[i + 1][j] +
        grid[i + 1][j + 1];
}

function transform(grid) {
    var newGrid = [];
    newGrid[0] = grid[0].slice();

    for (var i = 1; i < grid.length - 1; i++) {
        var row = grid[i];
        newGrid[i] = row.slice();
        for (var j = 1; j < row.length - 1; j++) {
            var score = neighbors(grid, i, j);
            if (score === 3) {
                newGrid[i][j] = 1;
            } else if (score !== 2) {
                newGrid[i][j] = 0;
            }
        }
    }

    newGrid[grid.length - 1] = grid[grid.length - 1].slice();

    return newGrid;
}

function initGridHTML(element, grid) {
    var line = '';
    for (var i = 0; i < grid.length; i++) { line += '<td></td>'; }
    for (var i = 0; i < grid.length; i++) {
        element.append('<tr>' + line + '</tr>');
    }
}

function transformHTML(element, grid) {
    for (var i = 1; i < grid.length - 1; i++) {
        var row = grid[i];
        for (var j = 1; j < row.length - 1; j++) {
            var position = element.find('tr:nth-child(' + (i + 1) + ') td:nth-child(' + (j + 1) + ')');
            if (grid[i][j] === 1) {
                position.addClass('on');
            } else {
                position.removeClass('on');
            }
        }
    }
    return transform(grid);
}

if (typeof module != 'undefined' && module.exports)
    module.exports = transform;
