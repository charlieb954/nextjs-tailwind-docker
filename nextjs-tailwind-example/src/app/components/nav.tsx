import Link from 'next/link'

const NavBar = () => {
    return (
        <nav className="bg-gray-800 p-4">
            <div className="container mx-auto flex justify-between items-center">
                <div className="text-white text-lg font-bold">
                    <Link href="/">Hello World</Link>
                </div>
                <div className="space-x-4">
                    <Link className="text-gray-300 hover:text-white" href="/">Home</Link>
                    <Link className="text-gray-300 hover:text-white" href="/">About</Link>
                    <Link className="text-gray-300 hover:text-white" href="/">Contact</Link>
                </div>
            </div>
        </nav>
    );
};

export default NavBar;