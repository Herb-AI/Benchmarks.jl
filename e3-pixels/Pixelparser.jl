module PixelParser

using Data

export parseline_pixels

"""
Parses a line from a file in the `pixels` dataset
"""
function parseline_pixels(line::AbstractString)::IOExample
    # Helper function that converts a string to a list of booleans
    # Example: "0, 1, 1, 0" → [false, true, true, false]
    parseboollist(x) = map(y -> y == "1", split(x, ", "))
    
    # Extract data using RegEx
    matches = match(r"^pos\(w\([\d_]+,[\d_]+,(\d+),(\d+),\[([01, ]+)\]\)[,\)]w\([\d_]+,[\d_]+,(\d+),(\d+),\[([01, ]+)\]\)[,\)]\.$", line)
    
    # Parse data
    input_width = parse(Int, matches[1])
    input_height = parse(Int, matches[2])
    input = reshape(parseboollist(matches[3]), (input_width, input_height))
    output_width = parse(Int, matches[4])
    output_height = parse(Int, matches[5])
    output = reshape(parseboollist(matches[6]), (output_width, output_height))
    return IOExample(input, output)
end

end # module