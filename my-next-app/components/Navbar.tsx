import React from 'react';
import Link from 'next/link';
import { Navbar, Nav, NavItem } from 'react-bootstrap';

const Navigation = ({ userSignedIn }: { userSignedIn: false }) => {
  return (
    <Navbar bg="light" expand="lg">
      <Navbar.Brand>
        <Link href="/">Navbar</Link>
      </Navbar.Brand>
      <Navbar.Toggle aria-controls="navbarSupportedContent" />
      <Navbar.Collapse id="navbarSupportedContent">
        <Nav className="mr-auto">
          <NavItem>
            <Link href="/">Home</Link>
          </NavItem>
            <>
              <NavItem>
                <Link href="/signout">Sign Out</Link> {/* Change these paths based on your routes */}
              </NavItem>
              <NavItem>
                <Link href="/meal_carts">Cart</Link> {/* Change these paths based on your routes */}
              </NavItem>
            </>
            <NavItem>
              <Link href="/signin">Sign In</Link> {/* Change these paths based on your routes */}
            </NavItem>
        </Nav>
      </Navbar.Collapse>
    </Navbar>
  );
};

export default Navigation;
