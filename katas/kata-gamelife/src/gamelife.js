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

module.exports = transform;
