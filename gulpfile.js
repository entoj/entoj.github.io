/**
 * Requirements
 */
const gulp = require('gulp');
const ghPages = require('gulp-gh-pages');
const exec = require('exec-chainable');

/**
 *  Builds the book
 */
function buildGitBook(cb)
{
    console.log('Building GitBook');
    return exec('npm run build');
};


/**
 *  Publishes the book to GitHub Pages
 */
function publishToGitHubPages()
{
    console.log('Publishing to GitHub Pages');
    return gulp.src('./_book/**/*')
      .pipe(ghPages(
        {
          origin: 'origin',
          branch: 'master'
        }));
};


/**
 * Gulp tasks
 */
gulp.task('publish', gulp.series(buildGitBook, publishToGitHubPages));