import glob

ART_PATTERN = "album/*.jpg"

HORIZONTAL_RULE = "\n---------------"

def markdown_image(img):
    return f"![{img}]({img})"

def title():
    return "# art by luke fender\n"

def make_readme():
    file_handle = open('README.md', 'w')

    file_handle.write(title())

    entries = []

    for img in glob.glob(ART_PATTERN):
        print(img)
        entries.append(markdown_image(img))

    for entry in entries:
        print(entry)
        file_handle.write(f"\n{entry}")
        file_handle.write(HORIZONTAL_RULE)
    # horizontal_rule

    file_handle.close()

if __name__ == '__main__':
    make_readme()
