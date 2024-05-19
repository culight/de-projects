from setuptools import find_packages, setup

setup(
    name="job_search",
    packages=find_packages(exclude=["job_search_tests"]),
    install_requires=[
        "dagster",
        "dagster-cloud"
    ],
    extras_require={"dev": ["dagster-webserver", "pytest"]},
)
