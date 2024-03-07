from aa_commons.config.foo import bar


def test_inc() -> None:
    assert bar(3, 4) == 7
