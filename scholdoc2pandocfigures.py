#!/usr/bin/env python

from pandocfilters import toJSONFilter, stringify, Null, Str, Para, Image

figure_detected = False


def figures(key, value, format, meta):
    global figure_detected
    if figure_detected:
        figure_detected = False
        if key == 'Para':
            alt = stringify(value).replace(" Caption: ", "")
            para_list = []
            for item in value:
                if item['t'] == 'Image':
                    para_list.append(
                        Image([Str(alt)], [item["c"][1][0], "Figure"])
                    )
            return Para(para_list)
    if key == 'Header':
        level, refs, contents = value
        if level == 6 and contents[0]["c"] == "Figure:":
            figure_detected = True
            return Null()

if __name__ == "__main__":
    toJSONFilter(figures)
