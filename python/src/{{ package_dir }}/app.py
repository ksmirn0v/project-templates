"""Application entry point: the main logic of the project."""


def greet(name: str) -> str:
    """Return a greeting.

    Args:
        name: Who to greet.

    Returns:
        The greeting text.

    Raises:
        ValueError: If ``name`` is empty.
    """
    if not name.strip():
        raise ValueError("name must not be empty")
    return f"Hello, {name.strip()}!"
