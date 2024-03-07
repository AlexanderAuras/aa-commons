from aa_commons.yaml.foo import bar


def test_inc() -> None:
    assert bar(3, 4) == 7
