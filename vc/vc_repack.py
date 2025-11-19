import os
import shutil
import sys
import shutil
from pathlib import Path
from glob import glob

class Environment:
    # Read in conda build environment variables
    # This allows us to pass them round and refer to them as
    # e.recipe_dir, etc.
    items = [
        "RECIPE_DIR",
        "SRC_DIR",
        "PREFIX",
        "BUILD_PREFIX",
        "LIBRARY_BIN",
    ]

    def __init__(self):
        self.__attrs = {}
        for i in self.items:
            key = i.lower()
            value = os.environ.get(i, None)
            if value is None:
                if i == "LIBRARY_BIN":
                    value = os.path.join(os.environ.get("PREFIX"), "Library", "bin")
                else:
                    raise RuntimeError(f"{i} not set in environment")
            self.__attrs[key] = value

    def __getattr__(self, name):
        if name in self.__attrs:
            return self.__attrs[name]
        else:
            raise AttributeError

def main():
    print("env", os.environ["PATH"])

    try:
        env = Environment()
    except RuntimeError as e:
        print("Error:", e)
        print()
        print("This script expects to be run in a conda build environment")
        print("with these environment variables set:")
        print(" ", ", ".join(Environment.items))
        sys.exit(2)

    tgt_dir = Path(f"{env.prefix}/etc/conda/activate.d")
    os.makedirs(tgt_dir)
    shutil.copytree(f'{Path(f"{env.recipe_dir}/vs_activate.ps1")}', f'{tgt_dir}', dirs_exist_ok=True)


if __name__ == "__main__":
    main()
