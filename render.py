from jinja2 import Environment, FileSystemLoader
from dotenv import dotenv_values
from pathlib import Path

if __name__ == "__main__":
    env = Environment(
        loader=FileSystemLoader(Path()),
        variable_start_string="{@",
        variable_end_string="@}",
    )
    variables = dotenv_values()
    for path in Path().rglob("*.j2*"):
        template = env.get_template(str(path))
        rendered = template.render(**variables)
        path.with_stem(path.stem.strip(".j2")).write_text(rendered)
    for path in Path().rglob("*.env"):
        path.with_suffix(".example").write_text(
            "\n".join([f"{key}=" for key in variables])
        )
