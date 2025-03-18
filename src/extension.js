const vscode = require('vscode');

function activate(context) {
    // Register a command to inject our custom CSS and JS
    let disposable = vscode.commands.registerCommand('vscode-file-preview.enable', () => {
        // Inject the CSS and JS files
        const workbenchConfig = vscode.workspace.getConfiguration('workbench');
        const currentCSS = workbenchConfig.get('customCSS') || '';
        const currentJS = workbenchConfig.get('customJS') || '';
        
        // Add our files to the configuration
        workbenchConfig.update('customCSS', currentCSS + '\n@import "file:///path/to/vscode-file-preview.css"', true);
        workbenchConfig.update('customJS', currentJS + '\n@import "file:///path/to/vscode-file-preview.js"', true);
    });

    // Register a command to handle file preview requests
    let previewHandler = vscode.commands.registerCommand('vscode-file-preview.getFileContent', async (filePath) => {
        try {
            const uri = vscode.Uri.file(filePath);
            const document = await vscode.workspace.openTextDocument(uri);
            return document.getText();
        } catch (error) {
            console.error('Error reading file:', error);
            return null;
        }
    });

    context.subscriptions.push(disposable, previewHandler);
}

function deactivate() {}

module.exports = {
    activate,
    deactivate
} 