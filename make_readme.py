import glob

def markdown_image(img):
    return f"![{img}]({img})"

def make_readme():
    file_handle = open('README.md', 'w')

    entries = []

    for img in glob.glob("*.jpg"):
        print(img)
        entries.append(markdown_image(img))

    for entry in entries:
        print(entry)
        file_handle.write(f"\n{entry}")



if __name__ == '__main__':
    make_readme()
