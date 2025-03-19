workflow {
    // Read the directory path from the configuration
    def inputDir = params.inputDir

    // Check if the directory exists
    if (!file(inputDir).exists()) {
        exit 1, "Directory $inputDir does not exist."
    }

    // Recursively list all files in the directory and its subdirectories
    Channel.fromPath("${inputDir}/**", checkIfExists: true)
           .map { file -> file.toString() }  // Use toString() to get the full path
           .view { "File: $it" }
}
